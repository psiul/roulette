select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 211 and ss.ss_hash <= 961 and c.c_hash >= 285 and c.c_hash <= 618 and d.d_hash >= 597 and d.d_hash <= 997
;
