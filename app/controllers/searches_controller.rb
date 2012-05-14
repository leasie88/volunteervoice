class SearchesController < ApplicationController

  def show
    @sunspot_search = Sunspot.search Program, Organization do |query| 
      query.keywords params[:search]
   end 
   @results = @sunspot_search.results
   
   @theRegions = Hash.new ['AF' => 16, 
   'AX' => 6, 
   'AL' => 9, 
   'DZ' => 1, 
   'AS' => 22, 
   'AD' => 9, 
   'AO' => 3, 
   'AI' => 11, 
   'AQ' => 0, 
   'AG' => 11, 
   'AR' => 13, 
   'AM' => 18, 
   'AW' => 11, 
   'AU' => 19, 
   'AT' => 7, 
   'AZ' => 18, 
   'BS' => 11, 
   'BH' => 18, 
   'BD' => 16, 
   'BB' => 11, 
   'BY' => 8, 
   'BE' => 7, 
   'BZ' => 12, 
   'BJ' => 2, 
   'BM' => 10, 
   'BT' => 16, 
   'BO' => 13, 
   'BQ' => 0, 
   'BA' => 9, 
   'BW' => 5, 
   'BV' => 0, 
   'BR' => 13, 
   'IO' => 0, 
   'BN' => 17, 
   'BG' => 8, 
   'BF' => 2, 
   'BI' => 4, 
   'KH' => 17, 
   'CM' => 3, 
   'CA' => 10, 
   'CV' => 2, 
   'KY' => 11, 
   'CF' => 3, 
   'TD' => 3, 
   'CL' => 13, 
   'CN' => 15, 
   'CX' => 0, 
   'CC' => 0, 
   'CO' => 13, 
   'KM' => 4, 
   'CG' => 3, 
   'CD' => 3, 
   'CK' => 22, 
   'CR' => 12, 
   'CI' => 2, 
   'HR' => 9, 
   'CU' => 11, 
   'CW' => 0, 
   'CY' => 18, 
   'CZ' => 8, 
   'DK' => 6, 
   'DJ' => 4, 
   'DM' => 11, 
   'DO' => 11, 
   'EC' => 13, 
   'EG' => 1, 
   'SV' => 12, 
   'GQ' => 3, 
   'ER' => 4, 
   'EE' => 6, 
   'ET' => 4, 
   'FK' => 13, 
   'FO' => 6, 
   'FJ' => 20, 
   'FI' => 6, 
   'FR' => 7, 
   'GF' => 13, 
   'PF' => 22, 
   'TF' => 0, 
   'GA' => 3, 
   'GM' => 2, 
   'GE' => 18, 
   'DE' => 7, 
   'GH' => 2, 
   'GI' => 9, 
   'GR' => 9, 
   'GL' => 10, 
   'GD' => 11, 
   'GP' => 11, 
   'GU' => 21, 
   'GT' => 12, 
   'GG' => 6, 
   'GN' => 2, 
   'GW' => 2, 
   'GY' => 13, 
   'HT' => 11, 
   'HM' => 0, 
   'VA' => 9, 
   'HN' => 12, 
   'HK' => 15, 
   'HU' => 8, 
   'IS' => 6, 
   'IN' => 16, 
   'ID' => 17, 
   'IR' => 16, 
   'IQ' => 18, 
   'IE' => 6, 
   'IM' => 6, 
   'IL' => 18, 
   'IT' => 9, 
   'JM' => 11, 
   'JP' => 15, 
   'JE' => 6, 
   'JO' => 18, 
   'KZ' => 14, 
   'KE' => 4, 
   'KI' => 21, 
   'KP' => 15, 
   'KR' => 15, 
   'KW' => 18, 
   'KG' => 14, 
   'LA' => 17, 
   'LV' => 6, 
   'LB' => 18, 
   'LS' => 5, 
   'LR' => 2, 
   'LY' => 1, 
   'LI' => 7, 
   'LT' => 6, 
   'LU' => 7, 
   'MO' => 15, 
   'MK' => 9, 
   'MG' => 4, 
   'MW' => 4, 
   'MY' => 17, 
   'MV' => 16, 
   'ML' => 2, 
   'MT' => 9, 
   'MH' => 21, 
   'MQ' => 11, 
   'MR' => 2, 
   'MU' => 4, 
   'YT' => 4, 
   'MX' => 12, 
   'FM' => 21, 
   'MD' => 8, 
   'MC' => 7, 
   'MN' => 15, 
   'ME' => 9, 
   'MS' => 11, 
   'MA' => 1, 
   'MZ' => 4, 
   'MM' => 17, 
   'NA' => 5, 
   'NR' => 21, 
   'NP' => 16, 
   'NL' => 7, 
   'NC' => 20, 
   'NZ' => 19, 
   'NI' => 12, 
   'NE' => 2, 
   'NG' => 2, 
   'NU' => 22, 
   'NF' => 19, 
   'MP' => 21, 
   'NO' => 6, 
   'OM' => 18, 
   'PK' => 16, 
   'PW' => 21, 
   'PS' => 18, 
   'PA' => 12, 
   'PG' => 20, 
   'PY' => 13, 
   'PE' => 13, 
   'PH' => 17, 
   'PN' => 22, 
   'PL' => 8, 
   'PT' => 9, 
   'PR' => 11, 
   'QA' => 18, 
   'RE' => 4, 
   'RO' => 8, 
   'RU' => 8, 
   'RW' => 4, 
   'BL' => 11, 
   'SH' => 2, 
   'KN' => 11, 
   'LC' => 11, 
   'MF' => 11, 
   'PM' => 10, 
   'VC' => 11, 
   'WS' => 22, 
   'SM' => 9, 
   'ST' => 3, 
   'SA' => 18, 
   'SN' => 2, 
   'RS' => 9, 
   'SC' => 4, 
   'SL' => 2, 
   'SG' => 17, 
   'SX' => 0, 
   'SK' => 8, 
   'SI' => 9, 
   'SB' => 20, 
   'SO' => 4, 
   'ZA' => 5, 
   'GS' => 0, 
   'SS' => 0, 
   'ES' => 9, 
   'LK' => 16, 
   'SD' => 1, 
   'SR' => 13, 
   'SJ' => 6, 
   'SZ' => 5, 
   'SE' => 6, 
   'CH' => 7, 
   'SY' => 18, 
   'TW' => 15, 
   'TJ' => 14, 
   'TZ' => 4, 
   'TH' => 17, 
   'TL' => 17, 
   'TG' => 2, 
   'TK' => 22, 
   'TO' => 22, 
   'TT' => 11, 
   'TN' => 1, 
   'TR' => 18, 
   'TM' => 14, 
   'TC' => 11, 
   'TV' => 22, 
   'UG' => 4, 
   'UA' => 8, 
   'AE' => 18, 
   'GB' => 6, 
   'US' => 10, 
   'UM' => 0, 
   'UY' => 13, 
   'UZ' => 14, 
   'VU' => 20, 
   'VE' => 13, 
   'VN' => 17, 
   'VG' => 11, 
   'VI' => 11, 
   'WF' => 22, 
   'EH' => 1, 
   'YE' => 18, 
   'ZM' => 4, 
   'ZW' => 4]
  end
  
  def index
    @programsSearch = Sunspot.search(Program) do |query|
      query.keywords params[:search]
    end
    @results = @programsSearch.results
    
    @theRegions = Hash.new ['AF' => 16, 
    'AX' => 6, 
    'AL' => 9, 
    'DZ' => 1, 
    'AS' => 22, 
    'AD' => 9, 
    'AO' => 3, 
    'AI' => 11, 
    'AQ' => 0, 
    'AG' => 11, 
    'AR' => 13, 
    'AM' => 18, 
    'AW' => 11, 
    'AU' => 19, 
    'AT' => 7, 
    'AZ' => 18, 
    'BS' => 11, 
    'BH' => 18, 
    'BD' => 16, 
    'BB' => 11, 
    'BY' => 8, 
    'BE' => 7, 
    'BZ' => 12, 
    'BJ' => 2, 
    'BM' => 10, 
    'BT' => 16, 
    'BO' => 13, 
    'BQ' => 0, 
    'BA' => 9, 
    'BW' => 5, 
    'BV' => 0, 
    'BR' => 13, 
    'IO' => 0, 
    'BN' => 17, 
    'BG' => 8, 
    'BF' => 2, 
    'BI' => 4, 
    'KH' => 17, 
    'CM' => 3, 
    'CA' => 10, 
    'CV' => 2, 
    'KY' => 11, 
    'CF' => 3, 
    'TD' => 3, 
    'CL' => 13, 
    'CN' => 15, 
    'CX' => 0, 
    'CC' => 0, 
    'CO' => 13, 
    'KM' => 4, 
    'CG' => 3, 
    'CD' => 3, 
    'CK' => 22, 
    'CR' => 12, 
    'CI' => 2, 
    'HR' => 9, 
    'CU' => 11, 
    'CW' => 0, 
    'CY' => 18, 
    'CZ' => 8, 
    'DK' => 6, 
    'DJ' => 4, 
    'DM' => 11, 
    'DO' => 11, 
    'EC' => 13, 
    'EG' => 1, 
    'SV' => 12, 
    'GQ' => 3, 
    'ER' => 4, 
    'EE' => 6, 
    'ET' => 4, 
    'FK' => 13, 
    'FO' => 6, 
    'FJ' => 20, 
    'FI' => 6, 
    'FR' => 7, 
    'GF' => 13, 
    'PF' => 22, 
    'TF' => 0, 
    'GA' => 3, 
    'GM' => 2, 
    'GE' => 18, 
    'DE' => 7, 
    'GH' => 2, 
    'GI' => 9, 
    'GR' => 9, 
    'GL' => 10, 
    'GD' => 11, 
    'GP' => 11, 
    'GU' => 21, 
    'GT' => 12, 
    'GG' => 6, 
    'GN' => 2, 
    'GW' => 2, 
    'GY' => 13, 
    'HT' => 11, 
    'HM' => 0, 
    'VA' => 9, 
    'HN' => 12, 
    'HK' => 15, 
    'HU' => 8, 
    'IS' => 6, 
    'IN' => 16, 
    'ID' => 17, 
    'IR' => 16, 
    'IQ' => 18, 
    'IE' => 6, 
    'IM' => 6, 
    'IL' => 18, 
    'IT' => 9, 
    'JM' => 11, 
    'JP' => 15, 
    'JE' => 6, 
    'JO' => 18, 
    'KZ' => 14, 
    'KE' => 4, 
    'KI' => 21, 
    'KP' => 15, 
    'KR' => 15, 
    'KW' => 18, 
    'KG' => 14, 
    'LA' => 17, 
    'LV' => 6, 
    'LB' => 18, 
    'LS' => 5, 
    'LR' => 2, 
    'LY' => 1, 
    'LI' => 7, 
    'LT' => 6, 
    'LU' => 7, 
    'MO' => 15, 
    'MK' => 9, 
    'MG' => 4, 
    'MW' => 4, 
    'MY' => 17, 
    'MV' => 16, 
    'ML' => 2, 
    'MT' => 9, 
    'MH' => 21, 
    'MQ' => 11, 
    'MR' => 2, 
    'MU' => 4, 
    'YT' => 4, 
    'MX' => 12, 
    'FM' => 21, 
    'MD' => 8, 
    'MC' => 7, 
    'MN' => 15, 
    'ME' => 9, 
    'MS' => 11, 
    'MA' => 1, 
    'MZ' => 4, 
    'MM' => 17, 
    'NA' => 5, 
    'NR' => 21, 
    'NP' => 16, 
    'NL' => 7, 
    'NC' => 20, 
    'NZ' => 19, 
    'NI' => 12, 
    'NE' => 2, 
    'NG' => 2, 
    'NU' => 22, 
    'NF' => 19, 
    'MP' => 21, 
    'NO' => 6, 
    'OM' => 18, 
    'PK' => 16, 
    'PW' => 21, 
    'PS' => 18, 
    'PA' => 12, 
    'PG' => 20, 
    'PY' => 13, 
    'PE' => 13, 
    'PH' => 17, 
    'PN' => 22, 
    'PL' => 8, 
    'PT' => 9, 
    'PR' => 11, 
    'QA' => 18, 
    'RE' => 4, 
    'RO' => 8, 
    'RU' => 8, 
    'RW' => 4, 
    'BL' => 11, 
    'SH' => 2, 
    'KN' => 11, 
    'LC' => 11, 
    'MF' => 11, 
    'PM' => 10, 
    'VC' => 11, 
    'WS' => 22, 
    'SM' => 9, 
    'ST' => 3, 
    'SA' => 18, 
    'SN' => 2, 
    'RS' => 9, 
    'SC' => 4, 
    'SL' => 2, 
    'SG' => 17, 
    'SX' => 0, 
    'SK' => 8, 
    'SI' => 9, 
    'SB' => 20, 
    'SO' => 4, 
    'ZA' => 5, 
    'GS' => 0, 
    'SS' => 0, 
    'ES' => 9, 
    'LK' => 16, 
    'SD' => 1, 
    'SR' => 13, 
    'SJ' => 6, 
    'SZ' => 5, 
    'SE' => 6, 
    'CH' => 7, 
    'SY' => 18, 
    'TW' => 15, 
    'TJ' => 14, 
    'TZ' => 4, 
    'TH' => 17, 
    'TL' => 17, 
    'TG' => 2, 
    'TK' => 22, 
    'TO' => 22, 
    'TT' => 11, 
    'TN' => 1, 
    'TR' => 18, 
    'TM' => 14, 
    'TC' => 11, 
    'TV' => 22, 
    'UG' => 4, 
    'UA' => 8, 
    'AE' => 18, 
    'GB' => 6, 
    'US' => 10, 
    'UM' => 0, 
    'UY' => 13, 
    'UZ' => 14, 
    'VU' => 20, 
    'VE' => 13, 
    'VN' => 17, 
    'VG' => 11, 
    'VI' => 11, 
    'WF' => 22, 
    'EH' => 1, 
    'YE' => 18, 
    'ZM' => 4, 
    'ZW' => 4]
  end

end