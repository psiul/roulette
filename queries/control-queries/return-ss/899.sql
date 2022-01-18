select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,store_returns sr,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 429 and ss.ss_hash <= 762 and i.i_hash >= 185 and i.i_hash <= 935 and c.c_hash >= 463 and c.c_hash <= 863
;
