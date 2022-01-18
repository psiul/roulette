select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,household_demographics hd,customer_demographics cd,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and sm.sm_hash >= 72 and sm.sm_hash <= 822 and hd.hd_hash >= 154 and hd.hd_hash <= 487 and d.d_hash >= 79 and d.d_hash <= 479
;
