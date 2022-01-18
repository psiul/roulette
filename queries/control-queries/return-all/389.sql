select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,household_demographics hd,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 396 and ws.ws_hash <= 796 and hd.hd_hash >= 4 and hd.hd_hash <= 754 and c.c_hash >= 559 and c.c_hash <= 892
;
