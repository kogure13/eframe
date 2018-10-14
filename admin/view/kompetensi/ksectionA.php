<table class="table table-condensed table-responsive">
  <tbody>
    <tr>
      <td colspan="5">A. Komplain Audit</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>1)</td>
      <td width="30%">Audit atas pertanggungjawaban keuangan</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ka11", "ya", "ka1")?>

          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ka12", "tidak", "ka1")?>

          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>2)</td>
      <td>Audit pengadaan barang dan jasa</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ka21", "ya", "ka2")?>

          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ka22", "tidak", "ka2")?>

          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>3)</td>
      <td>Audit kepegawaian</td>
      <td>:</td>
      <td><div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ka31", "ya", "ka3")?>

          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ka32", "tidak", "ka3")?>

          <label for="tidak"> Tidak </label>
        </div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>4)</td>
      <td>Audit atas subtansi pendidikan</td>
      <td>:</td>
      <td><div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ka41", "ya", "ka4")?>

          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ka42", "tidak", "ka4")?>

          <label for="tidak"> Tidak </label>
        </div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>5)</td>
      <td>Audit e-Proc</td>
      <td>:</td>
      <td><div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ka51", "ya", "ka5")?>

          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ka52", "tidak", "ka5")?>

          <label for="tidak"> Tidak </label>
        </div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>6)</td>
      <td>Audit lainnya, Sebutkan</td>
      <td>:</td>
      <td><?=$userUI->closeTags("textarea", "form-control", "ka6", "ka6")?></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="5">B. Performa Audit</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>1)</td>
      <td>Audit kinerja atas organisasi</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "kb11", "ya", "kb1")?>

          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "kb12", "tidak", "kb1")?>

          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>2)</td>
      <td>Audit kinerja atas informasi dan teknologi</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "kb21", "ya", "kb2")?>

          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "kb22", "tidak", "kb2")?>

          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3">C. Audit Tujuan Tertentu / Investigasi</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "kc11", "ya", "kc1")?>

          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "kc12", "tidak", "kc1")?>

          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
  </tbody>
</table>
