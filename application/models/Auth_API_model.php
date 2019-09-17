<?php

class Auth_API_model extends CI_Model
{
	public function login($data){
		$user = $this->db->get_where('users',
			['name'=>$data['name'],
			'roles'=>"GURU"]
		)->row_array();

		$password = password_verify($data['password'],$user['password']);

		$dataUser = $this->db->get_where('peg_guru',
			['id'=>$user['id']
		])->row_array();

		$dataUser['email'] = $user['email'];

		if ($user && $password){
			return $dataUser;
			// return true;
		}else{
			return false;
		}
	}
}
