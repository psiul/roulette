select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and d.d_hash >= 71 and d.d_hash <= 821 and hd.hd_hash >= 595 and hd.hd_hash <= 995 and i.i_hash >= 71 and i.i_hash <= 404
;
