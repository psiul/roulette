select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,store_returns sr,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 593 and d.d_hash <= 926 and i.i_hash >= 564 and i.i_hash <= 964 and hd.hd_hash >= 138 and hd.hd_hash <= 888
;
