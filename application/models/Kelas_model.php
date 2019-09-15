<?php

class Kelas_model extends CI_Model
{
    public function getKelas($id = null){
        if ($id === null) {
			$this->db->select('*');
			$this->db->from('peg_kelas');
			$this->db->join('peg_walikelas', 'peg_walikelas.id_walikelas=peg_walikelas.id_walikelas', 'left');
			$this->db->join('peg_tahun_ajaran', 'peg_tahun_ajaran.id_tahun_ajaran=peg_kelas.id_TA', 'left');
			return $this->db->get()->result_array();
        }else{
            return $this->db->get_where('peg_kelas',['id' => $id])->result_array();
        }
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
