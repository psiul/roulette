select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 484 and ss.ss_hash <= 884 and i.i_hash >= 21 and i.i_hash <= 771 and d.d_hash >= 129 and d.d_hash <= 462
;
