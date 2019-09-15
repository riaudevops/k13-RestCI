<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller
{
	public function index()
	{
		if ($this->session->userdata('email')) {
			redirect('dashboard');
		}

		$username = $this->input->post('username');

		if (empty($username)) {
			$data['title'] = 'Login Page';
			$this->load->view('templates/login_header',$data);
			$this->load->view('auth/index', $data);
			$this->load->view('templates/login_footer');
		} else {
			$this->_login();
		}
	}

	private function _login(){

		$username = $this->input->post('username');
		$password = $this->input->post('password');

		$user = $this->db->get_where('users', ['name' => $username])->row_array();

		// jika usernya ada
		if ($user) {
			// jika usernya aktif

			// cek password
			if (password_verify($password, $user['password'])) {
				$data = [
					'email' => $user['email']
				];
				$this->session->set_userdata($data);
				redirect('dashboard');
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Password salah</div>');
				redirect('auth');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Username tidak ada</div>');
			redirect('auth');
		}
	}

	public function logout(){
		$this->session->unset_userdata('email');
		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil logout dari aplikasi</div>');
		redirect('auth');
	}
}
