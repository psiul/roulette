select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,customer c,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 313 and ws.ws_hash <= 713 and c.c_hash >= 604 and c.c_hash <= 937 and hd.hd_hash >= 57 and hd.hd_hash <= 807
;
