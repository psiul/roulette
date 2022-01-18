select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and d.d_hash >= 564 and d.d_hash <= 964 and i.i_hash >= 47 and i.i_hash <= 380 and hd.hd_hash >= 18 and hd.hd_hash <= 768
;
