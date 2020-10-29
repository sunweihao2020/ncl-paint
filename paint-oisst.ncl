begin
;************************************************
; read in netCDF file
;************************************************
  a = addfile("/data5/2019swh/data/pentad_OISST.nc","r")

  lat = a->lat
  lon = a->lon
  sst = a->SST
  sst = sst*0.01
  char_mon=(/"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"/)
  char_pen=(/"p22","p23","p24","p25","p26","p27","p28","p29","p30","p31","p32","p33","p34"/)


do ipen = 1,13

    wks = gsn_open_wks("png","/data5/2019swh/paint/pentad/OISST_"+ipen)
    res = True
    res@gsnDraw               = False
    res@gsnFrame              = False
    res@cnFillOn              = True     ; turn on color fill
    res@cnFillPalette         = "MPL_coolwarm"
    res@cnLineLabelsOn        = True
    res@lbOrientation         = "Vertical"   
    ;res@cnLevelSelectionMode       = "ExplicitLevels" 
    ;res@cnLevels             = ispan(-2,36,1)
    ;res@cnLevelSpacingF      = 0.5
    res@mpMinLatF            = -30      ; range to zoom in on
    res@mpMaxLatF            =  60.
    res@mpMinLonF            =  30.
    res@mpMaxLonF            = 150.
    
    ;res@tiMainString         = char_mon(imon-1)
    res@gsnCenterString      = "sea surface temperature"           ; plot center string
    res@gsnRightString        = "units:degC"
    res@gsnLeftString         = char_pen(ipen-1)
    res@tmYLLabelDeltaF = -0.6  ;坐标值跑出去了就调这个

    res@cnInfoLabelOrthogonalPosF = -0.07
    plot = gsn_csm_contour_map(wks,sst(ipen-1,:,:), res)  ; create plot
  
    polyres                   = True
    polyres@gsLineColor       = "black"
    polyres@gsLineThicknessF  = 5
    polyres@gsLineDashPattern = 2
    dum = gsn_add_polyline(wks, plot, (/30,150/), (/0,0/), polyres)
    draw(plot) ;delete(dum)
    frame(wks)

end do
end