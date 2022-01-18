select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 456 and ss.ss_hash <= 856 and cd.cd_hash >= 474 and cd.cd_hash <= 807 and i.i_hash >= 242 and i.i_hash <= 992
;
