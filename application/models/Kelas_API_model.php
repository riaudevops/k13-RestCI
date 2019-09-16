<?php

class Kelas_API_model extends CI_Model
{
    public function getKelas($id){
        if ($id === null) {
			$this->db->select('*');
			$this->db->from('peg_kelas');
			$this->db->join('peg_walikelas', 'peg_walikelas.id_walikelas=peg_walikelas.id_walikelas', 'left');
			$this->db->join('peg_tahun_ajaran', 'peg_tahun_ajaran.id_tahun_ajaran=peg_kelas.id_TA', 'left');
			return $this->db->get()->result_array();
        }else{
            $this->db->SELECT('*');
            $this->db->FROM('peg_mengajar');
            $this->db->JOIN('peg_guru', 'peg_mengajar.user_id = peg_guru.id','left');
            $this->db->JOIN('peg_kelas', 'peg_mengajar.id_kelas = peg_kelas.id_kelas','left');
            $this->db->JOIN('peg_mapel', 'peg_mengajar.id_mapel = peg_mapel.id_mapel','left');
            $this->db->WHERE('user_id ='.$id);
            return $this->db->get()->result_array();
        }

        // SELECT * FROM `peg_mengajar` LEFT JOIN `peg_guru` ON peg_mengajar.user_id = peg_guru.id LEFT JOIN `peg_kelas` ON  peg_mengajar.id_kelas = peg_kelas.id_kelas LEFT JOIN `peg_mapel` ON peg_mengajar.id_mapel = peg_mapel.id_mapel WHERE user_id = 2

    }

    public function deleteMahasiswa($id){
        $this->db->delete('mahasiswa', ['id' => $id]);
        return $this->db->affected_rows();
    }

    public function createKelas($data){
        $this->db->insert('kelas',$data);
        return $this->db->affected_rows();
    }

    public function updateMahasiswa($data,$id){
        $this->db->update('mahasiswa',$data,['id' => $id]);
        return $this->db->affected_rows();
    }
}
