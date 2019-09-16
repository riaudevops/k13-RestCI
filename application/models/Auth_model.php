<?php

class Auth_model extends CI_Model
{
	public function cekUsername($username){
		$valid = $this->db->get_where('users', ['name' => $username])->row_array();
		return $valid;
	}

	public function cekPassword($password,$hash){
		$valid = password_verify($password,$hash);
		return $valid;
	}
}
