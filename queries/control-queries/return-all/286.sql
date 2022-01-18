select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 187 and ss.ss_hash <= 587 and c.c_hash >= 222 and c.c_hash <= 972 and cd.cd_hash >= 426 and cd.cd_hash <= 759
;
