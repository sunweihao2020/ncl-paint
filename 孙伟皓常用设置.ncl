;不要马上画
res@gsnDraw      =  False                   ; do not draw the plot
res@gsnFrame     =  False

;等值线==============
;关闭信息界面
cnInfoLabelOn = False

;关闭labelbar
lbLabelBarOn = False

;等值线
res@cnLevelSelectionMode = "ManualLevels"
res@cnLevelSpacingF      = -30
res@cnMaxLevelValF       = 50
res@cnLevelSpacingF      = 4