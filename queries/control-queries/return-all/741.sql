select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,customer_demographics cd,ship_mode sm
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 95 and ws.ws_hash <= 845 and hd.hd_hash >= 386 and hd.hd_hash <= 786 and sm.sm_hash >= 143 and sm.sm_hash <= 476
;
