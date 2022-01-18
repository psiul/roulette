select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,date_dim d,ship_mode sm
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 64 and ws.ws_hash <= 397 and c.c_hash >= 218 and c.c_hash <= 618 and sm.sm_hash >= 160 and sm.sm_hash <= 910
;
