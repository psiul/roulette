select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,ship_mode sm,household_demographics hd,date_dim d
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and cd.cd_hash >= 262 and cd.cd_hash <= 595 and sm.sm_hash >= 180 and sm.sm_hash <= 930 and hd.hd_hash >= 225 and hd.hd_hash <= 625
;
