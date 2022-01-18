select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 136 and ss.ss_hash <= 886 and c.c_hash >= 183 and c.c_hash <= 516 and cd.cd_hash >= 413 and cd.cd_hash <= 813
;
