select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,ship_mode sm,customer_demographics cd
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 109 and hd.hd_hash <= 859 and d.d_hash >= 49 and d.d_hash <= 382 and cd.cd_hash >= 294 and cd.cd_hash <= 694
;
