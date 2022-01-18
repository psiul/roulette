select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,household_demographics hd,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 138 and c.c_hash <= 888 and hd.hd_hash >= 61 and hd.hd_hash <= 394 and cd.cd_hash >= 282 and cd.cd_hash <= 682
;
