select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 724 and ss.ss_hash <= 924 and i.i_hash >= 225 and i.i_hash <= 725
;
