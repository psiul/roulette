select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 116 and ss.ss_hash <= 866 and hd.hd_hash >= 546 and hd.hd_hash <= 946 and i.i_hash >= 22 and i.i_hash <= 355
;
