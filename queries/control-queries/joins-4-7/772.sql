select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 283 and ss.ss_hash <= 683 and i.i_hash >= 161 and i.i_hash <= 911 and hd.hd_hash >= 535 and hd.hd_hash <= 868
;
