select count(ws.ws_item_sk)
from web_sales ws,item i,warehouse w,household_demographics hd,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 188 and ws.ws_hash <= 938 and i.i_hash >= 485 and i.i_hash <= 818 and cd.cd_hash >= 586 and cd.cd_hash <= 986
;
