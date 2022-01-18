select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,household_demographics hd,customer c,warehouse w
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 129 and ws.ws_hash <= 879 and cd.cd_hash >= 58 and cd.cd_hash <= 391 and hd.hd_hash >= 446 and hd.hd_hash <= 846
;
