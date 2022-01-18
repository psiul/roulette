select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 430 and c.c_hash <= 830 and i.i_hash >= 421 and i.i_hash <= 754 and cd.cd_hash >= 21 and cd.cd_hash <= 771
;
