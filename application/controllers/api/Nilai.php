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

    public function index_get()
    {
    	$id_kelas = $this->get('idKelas');
		$id_mapel = $this->get('idMapel');

    	$data = [
			'id_kelas' => $id_kelas,
			'id_mapel' => $id_mapel
		];

        if (empty($id_kelas) && empty($id_mapel)){
            $this->response([
                'status' => false,
                'message' => 'provide any id'
            ],REST_Controller::HTTP_BAD_REQUEST);
        }else{
            $transkripPdf = $this->nilai->getTranskrip($data);
        }
        
        if($transkripPdf){

        	// var_dump($transkripPdf);
        	// die();

            $this->load->library('pdf');
        	$this->pdf->setPaper('A4', 'potrait');
        	$this->pdf->filename = "Transkrip Nilai ".$transkripPdf[0]['MATA_PELAJARAN']." Kelas ".$transkripPdf[0]['nama_kelas'].".pdf";
        	$this->pdf->load_view('transkrip_pdf',['holder'=>$transkripPdf]);
        }else{
            $this->response([
                'status' => false,
                'message' => 'id not found'
			],REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function index_post()
    {
        $id_siswa = $this->post('idSiswa');
        $id_mapel = $this->post('idMapel');
        $nilai_nph = $this->post('nilaiNph');
        $nilai_uts = $this->post('nilaiUts');
        $nilai_uas = $this->post('nilaiUas');
        $nilai_rata = $this->post('nilaiRata');

        $data = [
			'id_siswa' => $id_siswa,
			'id_mapel' => $id_mapel,
			'NPH' => $nilai_nph,
			'UTS' => $nilai_uts,
			'UAS' => $nilai_uas,
			'RATA_RATA' => $nilai_rata,
		];

        if (empty($id_siswa) || empty($id_mapel) || empty($nilai_nph) || empty($nilai_uts) || empty($nilai_uas) || empty($nilai_rata)){
            $this->response([
                'status' => false,
                'message' => 'provide any id'
            ],REST_Controller::HTTP_BAD_REQUEST);
        }else{
        	$rowExist = $this->nilai->cekData($data);
        	if ($rowExist > 0) {
        		$insertNilai = $this->nilai->updateNilai($data);
        	}else{
        		$insertNilai = $this->nilai->insertNilai($data);
        	}
        }
        
        if($insertNilai > 0){
            $this->response([
                'status' => true,
                'message' => 'success'
            ], REST_Controller::HTTP_OK);
        }else{
            $this->response([
                'status' => false,
                'message' => 'failed'
            ],REST_Controller::HTTP_NOT_FOUND);
        }
    }
}

?>