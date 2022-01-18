select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,store_returns sr,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 586 and ss.ss_hash <= 986 and i.i_hash >= 3 and i.i_hash <= 753 and c.c_hash >= 630 and c.c_hash <= 963
;
