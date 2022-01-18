select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,household_demographics hd,web_returns wr
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 575 and ws.ws_hash <= 975 and sm.sm_hash >= 590 and sm.sm_hash <= 923 and c.c_hash >= 81 and c.c_hash <= 831
;
