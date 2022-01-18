select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,customer_demographics cd,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 21 and ws.ws_hash <= 771 and d.d_hash >= 628 and d.d_hash <= 961 and hd.hd_hash >= 74 and hd.hd_hash <= 474
;
