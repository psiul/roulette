select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,household_demographics hd,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 139 and ws.ws_hash <= 539 and sm.sm_hash >= 573 and sm.sm_hash <= 906 and hd.hd_hash >= 132 and hd.hd_hash <= 882
;
