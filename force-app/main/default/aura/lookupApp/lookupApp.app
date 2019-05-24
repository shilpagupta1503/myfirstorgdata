<aura:application extends="force:slds">
  <!-- Create attribute to store lookup value as a sObject--> 
  <!--<aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>-->
 
  <!--<c:parentlookupComp objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" />-->
    <c:testlookup/>
 <!-- here c: is org. namespace prefix-->
</aura:application>