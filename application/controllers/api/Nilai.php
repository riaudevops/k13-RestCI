<?php
use Restserver\Libraries\REST_Controller;

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Nilai extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Nilai_API_model','nilai');
    }

    public function index_get($data)
    {
    	$id = $this->get('id');
    	$id_kelas = $this->get('idKelas');
		$id_mapel = $this->get('idMapel');

    	$data = [
			'id' => $id,
			'id_kelas' => $id_kelas,
			'id_mapel' => $id_mapel,
		];

        if (empty($id) || empty($id_kelas) || empty($id_mapel)){
            $this->response([
                'status' => false,
                'message' => 'provide any id'
            ],REST_Controller::HTTP_BAD_REQUEST);
        }else{
            $dataSiswa = $this->nilai->getDataSiswa($data['id']);
            $transkripPdf = $this->nilai->getTranskrip($data);
        }
        
        if($dataSiswa && $transkripPdf){

        	// var_dump($transkripPdf);
        	// die();

            $this->load->library('pdf');
        	$this->pdf->setPaper('A4', 'potrait');
        	$this->pdf->filename = "Transkrip Nilai ".trim($dataSiswa['NAMA']).".pdf";
        	$this->pdf->load_view('transkrip_pdf',['holder'=>$transkripPdf]);
        }else{
            $this->response([
                'status' => false,
                'message' => 'id not found'
			],REST_Controller::HTTP_NOT_FOUND);
        }

    }
}

?>