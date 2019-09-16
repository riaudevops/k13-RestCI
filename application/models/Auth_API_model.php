<?php

class Auth_API_model extends CI_Model
{
	public function login($data){
		$user = $this->db->get_where('users',
			['name'=>$data['name'],
				'roles'=>"GURU"
			]
		)->row_array();

		$password = password_verify($data['password'],$user['password']);
		if ($user && $password){
			return $user['api_key'];
			// return true;
		}else{
			return false;
		}
	}
}
