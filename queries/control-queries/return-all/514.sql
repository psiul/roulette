select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,store_returns sr,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 218 and ss.ss_hash <= 968 and c.c_hash >= 564 and c.c_hash <= 964 and cd.cd_hash >= 658 and cd.cd_hash <= 991
;
