select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,customer_demographics cd,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 415 and d.d_hash <= 815 and cd.cd_hash >= 188 and cd.cd_hash <= 938 and hd.hd_hash >= 253 and hd.hd_hash <= 586
;
