select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,customer_demographics cd,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 543 and ws.ws_hash <= 943 and cd.cd_hash >= 466 and cd.cd_hash <= 799 and hd.hd_hash >= 105 and hd.hd_hash <= 855
;
