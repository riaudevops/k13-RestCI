<?php

class Nilai_API_model extends CI_Model {

	public function getRekapNilai($data)
	{
		$this->db->SELECT('nilai_pengetahuan.id_siswa');
		$this->db->SELECT('NAMA');
		$this->db->SELECT('NIS');
		$this->db->SELECT('nilai_pengetahuan.id_mapel');
		$this->db->SELECT('NPH');
		$this->db->SELECT('UTS');
		$this->db->SELECT('UAS');
		$this->db->SELECT('RATA_RATA');
		$this->db->SELECT('MATA_PELAJARAN');
		$this->db->SELECT('nama_kelas');
        $this->db->FROM('nilai_pengetahuan');
        $this->db->JOIN('peg_kelas_siswa', 'nilai_pengetahuan.id_siswa = peg_kelas_siswa.id_siswa','left');
        $this->db->JOIN('peg_kelas', 'peg_kelas_siswa.id_kelas = peg_kelas.id_kelas','left');
        $this->db->JOIN('peg_mapel', 'nilai_pengetahuan.id_mapel = peg_mapel.id_mapel','left');
        $this->db->JOIN('peg_siswa', 'nilai_pengetahuan.id_siswa = peg_siswa.id_siswa','left');
        $this->db->WHERE('peg_kelas_siswa.id_kelas = '.$data['id_kelas']);
        $this->db->WHERE('peg_mapel.id_mapel = '.$data['id_mapel']);
        return $this->db->get()->result_array();
	}

	public function cekData($data)
	{
		$nilaiSiswa = $this->db->get_where('nilai_pengetahuan',
			[
			 'id_siswa' => $data['id_siswa'],
			 'id_mapel' => $data['id_mapel']
			]
		);
		return $nilaiSiswa->num_rows();
	}

	public function updateNilai($data)
	{
		$data = array(
	        'id_siswa' => $data['id_siswa'],
	        'id_mapel' => $data['id_mapel'],
	        'NPH' => $data['NPH'],
	        'UTS' => $data['UTS'],
	        'UAS' => $data['UAS'],
	        'RATA_RATA' => $data['RATA_RATA']
		);

		$this->db->where('id_siswa', $data['id_siswa']);
		$this->db->where('id_mapel', $data['id_mapel']);
		return $this->db->update('nilai_pengetahuan', $data);
	}

	public function insertNilai($data)
	{
		$data = array(
	        'id_siswa' => $data['id_siswa'],
	        'id_mapel' => $data['id_mapel'],
	        'NPH' => $data['NPH'],
	        'UTS' => $data['UTS'],
	        'UAS' => $data['UAS'],
	        'RATA_RATA' => $data['RATA_RATA']
		);

		return $this->db->insert('nilai_pengetahuan', $data);
	}
}


/*

SELECT nilai_pengetahuan.id_siswa, nilai_pengetahuan.id_mapel, NPH, UTS, UAS, RATA_RATA, peg_kelas.id_kelas, MATA_PELAJARAN FROM `nilai_pengetahuan` LEFT JOIN `peg_kelas_siswa` ON nilai_pengetahuan.id_siswa = peg_kelas_siswa.id_siswa LEFT JOIN `peg_kelas` ON peg_kelas_siswa.id_kelas = peg_kelas.id_kelas LEFT JOIN `peg_mapel` ON nilai_pengetahuan.id_mapel = peg_mapel.id_mapel WHERE peg_kelas_siswa.id_kelas = 1 AND peg_mapel.id_mapel = 1

*/
