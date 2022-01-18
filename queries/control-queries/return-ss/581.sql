select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and cd.cd_hash >= 272 and cd.cd_hash <= 605 and c.c_hash >= 498 and c.c_hash <= 898 and i.i_hash >= 135 and i.i_hash <= 885
;
