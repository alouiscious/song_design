THIS TABLE IS FOR THE _FORM SONGNOTES PARTIIAL VIEW
  <table>
    <td>
      Note Category:
    </td>
    <td>
      <%= f.radio_button(:type, "feature_solo") %>
      <%= f.label(:type_feature, "Feature/Solo") %>
    </td>
    <td>
      <%= f.radio_button(:type, "design") %> 
      <%= f.label(:type_design, "Design/Structure") %>
    </td> 
    <td>
      <%= f.radio_button(:type, "organizer") %> 
      <%= f.label(:type_design, "Organizer") %>
    </td>        
  </table>
  <br>