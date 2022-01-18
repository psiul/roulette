select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,household_demographics hd,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 454 and ws.ws_hash <= 854 and sm.sm_hash >= 232 and sm.sm_hash <= 982 and hd.hd_hash >= 49 and hd.hd_hash <= 382
;
