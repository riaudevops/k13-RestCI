<?php
use Restserver\Libraries\REST_Controller;

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Kelas extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Kelas_API_model','kelas');
    }

    public function index_get()
    {
        $id = $this->get('id');
        if ($id === null){
            $this->response([
                'status' => false,
                'message' => 'provide any id'
            ],REST_Controller::HTTP_BAD_REQUEST);
        }else{
            $kelas = $this->kelas->getKelas($id);
        }
        
        if($kelas){
            $this->response([
                'status' => true,
                'data' => $kelas
			], REST_Controller::HTTP_OK);
        }else{
            $this->response([
                'status' => false,
                'message' => 'id not found'
			],REST_Controller::HTTP_NOT_FOUND);
        }
    }
}


?>