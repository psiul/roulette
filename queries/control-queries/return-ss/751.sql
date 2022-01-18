select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,item i,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 113 and ss.ss_hash <= 513 and i.i_hash >= 205 and i.i_hash <= 538 and c.c_hash >= 196 and c.c_hash <= 946
;
