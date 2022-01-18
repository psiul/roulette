select count(ws.ws_item_sk)
from web_sales ws,warehouse w,household_demographics hd,customer c,customer_address a
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 106 and hd.hd_hash <= 856 and c.c_hash >= 349 and c.c_hash <= 682 and a.ca_hash >= 317 and a.ca_hash <= 717
;
