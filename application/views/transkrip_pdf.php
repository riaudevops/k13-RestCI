<center>
  <b>
    Transkrip Nilai
    <br>
    Sekolah Menengah Kejuruan TIGAMA
  </b>
  
</center>

<br>

<table>

  <tr>
    <td style="width: 100px">
      Mata Pelajaran
    </td>
    <td>
      : <?= $holder[0]['MATA_PELAJARAN'] ?>
    </td>
  </tr>

  <tr>
    <td>
      Kelas
    </td>
    <td>
      : <?= $holder[0]['nama_kelas'] ?>
    </td>
  </tr>

  <tr>
    <td>
      Semester
    </td>
    <td>
      : 2
    </td>
  </tr>

  <tr>
    <td>
      Tahun
    </td>
    <td>
      : 2019/2020
    </td>
  </tr>

</table>
<br>

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg .tg-i3dw{font-family:"Times New Roman", Times, serif !important;;border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-qgz6{font-family:"Times New Roman", Times, serif !important;;border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-spw2{font-family:"Times New Roman", Times, serif !important;;border-color:inherit;text-align:left;vertical-align:left}
.tg .tg-exl0{font-family:"Times New Roman", Times, serif !important;;border-color:inherit;text-align:center;vertical-align:middle}
</style>
<table class="tg" style="width: 700px">
<colgroup>
<col style="width: 28px">
<col style="width: 199px">
<col style="width: 206px">
<col style="width: 71px">
<col style="width: 69px">
<col style="width: 70px">
<col style="width: 100px">
</colgroup>
  <tr>
    <th class="tg-spw2" style="width: 8">No</th>
    <th class="tg-exl0">Nama</th>
    <th class="tg-exl0">NIS</th>
    <th class="tg-exl0">NPH</th>
    <th class="tg-exl0">UTS</th>
    <th class="tg-exl0">UAS</th>
    <th class="tg-i3dw">Rata-rata</th>
  </tr>
<?php 
  $i = 1;
  foreach ($holder as $data) {
    echo '
      <tr>
        <td class="tg-spw2">'.$i.'</td>
        <td class="tg-spw2">'.$data["NAMA"].'</td>
        <td class="tg-spw2">'.$data["NIS"].'</td>
        <td class="tg-spw2">'.$data["NPH"].'</td>
        <td class="tg-spw2">'.$data["UTS"].'</td>
        <td class="tg-spw2">'.$data["UAS"].'</td>
        <td class="tg-qgz6">'.$data["RATA_RATA"].'</td>
      </tr>
         ';
    $i++;
  } 
?>
  
  
</table>