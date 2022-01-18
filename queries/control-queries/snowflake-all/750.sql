select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,household_demographics hd,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 208 and d.d_hash <= 958 and hd.hd_hash >= 596 and hd.hd_hash <= 996 and cd.cd_hash >= 139 and cd.cd_hash <= 472
;
