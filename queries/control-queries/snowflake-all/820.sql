select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,ship_mode sm,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 176 and d.d_hash <= 926 and cd.cd_hash >= 469 and cd.cd_hash <= 869 and sm.sm_hash >= 262 and sm.sm_hash <= 595
;
