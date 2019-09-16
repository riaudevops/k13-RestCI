<?php
use Restserver\Libraries\REST_Controller;

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Auth extends REST_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Auth_API_model','AuthModel');
	}

	public function index_post(){
		$data = [
			'name' => $this->post('username'),
			'password' => $this->post('password'),
		];

		if (empty($data['name']) && empty($data['password'])){
			$this->response([
				'status' => false,
				'message' => 'Null parameter'
			],REST_Controller::HTTP_BAD_REQUEST);
		}else{
			$user = $this->AuthModel->login($data);
			if($user){
				$this->response([
					'status' => true,
					'message' => 'Success',
					'data' => $user,
				],REST_Controller::HTTP_OK);
			}else{
				$this->response([
					'status' => false,
					'message' => 'Failed'
				],REST_Controller::HTTP_FORBIDDEN);
			}
		}
	}
}
