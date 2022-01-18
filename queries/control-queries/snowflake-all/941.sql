select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,customer_demographics cd,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and sm.sm_hash >= 427 and sm.sm_hash <= 760 and cd.cd_hash >= 220 and cd.cd_hash <= 970 and hd.hd_hash >= 505 and hd.hd_hash <= 905
;
