<table class="table table-condensed table-responsive">
  <tbody>
    <tr>
      <td colspan="5">A. Reviu</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>1)</td>
      <td width="27%">Reviu laporan keuangan</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ra11", "ya", "ra1")?>
          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ra12", "tidak", "ra1")?>
          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>2)</td>
      <td>Reviu tindak lanjut hasil audit</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ra21", "ya", "ra2")?>
          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ra22", "tidak", "ra2")?>
          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>3)</td>
      <td>Reviu RKAL</td>
      <td>:</td>
      <td><div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ra31", "ya", "ra3")?>
          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "ra32", "tidak", "ra3")?>
          <label for="tidak"> Tidak </label>
        </div></td>
    </tr>    
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="5">B. Pendampingan</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>1)</td>
      <td>Pendampingan dalam PBJ</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "rb11", "ya", "rb1")?>
          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "rb12", "tidak", "rb1")?>
          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>2)</td>
      <td>Pendampingan peny. Lap pertanggungjawaban keuangan</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "rb21", "ya", "rb2")?>
          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "rb22", "tidak", "rb2")?>
          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>3)</td>
      <td>Pendampingan peny. Risk Register</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "rb31", "ya", "rb3")?>
          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "rb32", "tidak", "rb3")?>
          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>4)</td>
      <td>Fasilitas peny. Risk Fraud</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "rb41", "ya", "rb4")?>
          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "rb42", "tidak", "rb4")?>
          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>5)</td>
      <td>Pemantauan</td>
      <td>:</td>
      <td>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "rb51", "ya", "rb5")?>
          <label for="ya"> Ya </label>
        </div>
        <div class="radio radio-info radio-inline">
          <?=$userUI->rdck("radio", "rb52", "tidak", "rb5")?>
          <label for="tidak"> Tidak </label>
        </div>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>6)</td>
      <td>Lainnya, Sebutkan</td>
      <td>:</td>
      <td><?=$userUI->closeTags("textarea", "form-control", "rb6", "rb6")?></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>    
  </tbody>
</table>