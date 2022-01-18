select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer_demographics cd,ship_mode sm,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and hd.hd_hash >= 85 and hd.hd_hash <= 485 and cd.cd_hash >= 77 and cd.cd_hash <= 827 and sm.sm_hash >= 289 and sm.sm_hash <= 622
;
